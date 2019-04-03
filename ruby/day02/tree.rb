# declaring Tree class
class Tree
    attr_accessor :name, :children

    def initialize(name, children=[])
        @name = name
        @children = children
    end

    def visit_all(&block)
        visit &block
        children.each {|child| child.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

dad_tree = Tree.new('Dad', [
    Tree.new('Child1'),
    Tree.new('Child2')
])
dad_tree.visit {|node| p node.name}
dad_tree.visit_all {|node| p node.name}

print "-------\n"

# redefining Tree class (Open Classes)
class Tree

    def initialize(structure={})
        array_structure = structure.to_a[0]
        @name = array_structure[0]
        @children = []
        array_structure[1].each { |child| @children.push Tree.new(Hash[[child]]) }
    end

end

other_tree = Tree.new(
	:grandpa => {
		:dad => {
			:child1 => {}, :child2 => {}
		}, :uncle => {
			:cousin => {}
		}
	}
)
other_tree.visit {|node| p node.name}
other_tree.visit_all {|node| p node.name}
